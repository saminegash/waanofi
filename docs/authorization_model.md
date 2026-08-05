# Waanofi Authorization Model & Role Architecture

This document defines the formal access hierarchy, permission capabilities, and future multi-farm architecture for the Waanofi platform.

---

## 1. Role Hierarchy (7-Tier Model)

The platform enforces access controls across seven discrete user personas:

### 1. Platform Administrator (`platform_admin`)
- **Scope**: Global / Multi-Tenant.
- **Capabilities**: Full audit inspection across all farms, system configuration, dispute resolution, and cross-tenant support investigation.
- **Implementation**: Verified via `profiles.role = 'admin'` with system-level flag or elevated claims in Auth JWT.

### 2. Farm Owner (`farm_owner`)
- **Scope**: Tenant / Single Farm (`farms.owner_id`).
- **Capabilities**: Ultimate administrative authority over the farm. Can invite/remove workers, assign farm managers, modify farm pricing settings, view full financial analytics, and list batches on the marketplace.
- **Implementation**: Asserts ownership matching `farms.owner_id = auth.uid()`.

### 3. Farm Manager (`farm_manager`)
- **Scope**: Tenant Operational Administration.
- **Capabilities**: Manage animals, feed inventories, record production yields, view Operational & Financial reports, create marketplace listings, and process incoming buyer orders. Cannot delete the farm or transfer ownership.
- **Implementation**: Currently covered under `role = 'admin'` inside a specific farm; future separation via granular permissions.

### 4. Farm Worker (`farm_worker`)
- **Scope**: Field Operations.
- **Capabilities**: Record daily milk yields, egg collections, and feed consumption. Can update/delete their own submitted records within a 24-hour verification window.
- **Strict Exclusions**: ZERO access to financial cost metrics (`unit_cost`, feed record cost, revenue totals). Financial columns are excluded on both write (trigger-enforced) and read (view/RLS enforced).

### 5. Farm Viewer (`farm_viewer`)
- **Scope**: Read-Only Guest / External Consultant (e.g., Veterinarians, Auditors).
- **Capabilities**: Read-only access to herd health, animal status counts, and daily milk/egg production summaries. Cannot submit records or view financial ledgers.
- **Implementation**: Maps to `role = 'guest'`.

### 6. Marketplace Buyer (`buyer`)
- **Scope**: External Consumer or Merchant.
- **Capabilities**: Browse active marketplace listings, check out orders, and track real-time delivery lifecycle statuses (`pending` through `delivered`). Cannot access internal farm production tables or seller inventories.

### 7. Marketplace Operator (`marketplace_operator`)
- **Scope**: Global Marketplace Compliance.
- **Capabilities**: Review and approve batch listings, manage logistics driver assignments in `delivery_info`, and mediate buyer-seller transactions.

---

## 2. Authorization Rules & Enforcement Pattern

Every operational query and function execution MUST follow two layers of verification:
1. **Row-Level Security (RLS)**: Enforced directly inside PostgreSQL tables and operational views. Anonymous (`anon`) user requests are rejected globally across all farm and production tables.
2. **RPC Caller Verification**: Every PostgreSQL `SECURITY DEFINER` function explicitly sets `search_path = public, auth;` and verifies that the calling authenticated user belongs to the requested `farm_id` before executing any query logic.

---

## 3. Future Architecture: Multi-Farm Membership & Tenant Switching

### Current Limitations
Currently, a user is linked to one farm via `profiles.farm_id`. This prevents agricultural consultants, veterinarians, or multi-farm owners from accessing multiple tenant workspaces without creating separate email accounts.

### Proposed Multi-Tenant Transition
1. **New Table**: `farm_members`
   ```sql
   CREATE TABLE farm_members (
     id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
     farm_id UUID NOT NULL REFERENCES farms(id) ON DELETE CASCADE,
     user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
     role user_role NOT NULL DEFAULT 'user',
     active BOOLEAN NOT NULL DEFAULT true,
     created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
     CONSTRAINT uq_farm_member UNIQUE(farm_id, user_id)
   );
   ```
2. **Session Tenant Context**: When logging in or switching farms, the mobile application will set an active tenant context in local secure memory, and database RPCs will evaluate access against `EXISTS (SELECT 1 FROM farm_members WHERE farm_id = p_farm_id AND user_id = auth.uid() AND active = true)`.
