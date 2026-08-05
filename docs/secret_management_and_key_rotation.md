# Secret Management & Key Rotation Checklist

To maintain high security standard across Waanofi mobile applications, cloud deployments, and backend databases, all developers and administrators must strictly adhere to the policies and manual checklists outlined below.

---

## 1. Secret Handling Policy

- **Zero Hardcoding**: NEVER commit real secrets, private keys, API deployment tokens, keystore credentials, or Supabase service-role keys directly to version control or source code files.
- **Environment Variables**: All runtime configuration variables must be passed during builds using `--dart-define-from-file=.env` or environment secrets in continuous integration (CI) pipelines.
- **Service Role Exclusion**: Supabase `service_role` keys grant complete bypass of Row Level Security (RLS) and must strictly reside ONLY within server-side environments (such as Deno-powered Supabase Edge Functions or admin backend cron servers). They must never exist inside the Flutter client codebase.
- **Git Ignore**: Ensure all variations of environment files (`.env*`, except `.env.example`), signing keys (`*.jks`, `*.pem`, `key.properties`), and debug token files remain explicitly blocked in `.gitignore`.

---

## 2. Credentials requiring manual monitoring & potential rotation
If a developer machine is compromised, a team member leaves with access to production secrets, or a token is suspected of appearing in a debug log, the project owner MUST execute manual key rotations for the following critical credentials:

1. **Supabase Project JWT Secret & Service Role Key**
2. **Supabase Anonymous Publishable Key (`SUPABASE_ANON_KEY`)**
3. **Google Play Store App Signing Keystore (`*.jks`) & Service Account JSON**
4. **Sentry Error Tracking DSN (`SENTRY_DSN`) & Auth Token**
5. **Telebirr & CBE Merchant Payment Sandbox/Production API Secrets (Future integration)**

---

## 3. Manual Key-Rotation Action Checklist

### A. Supabase Keys Rotation (JWT Secret, Anon, Service Role)
1. Log into the **Supabase Dashboard** → Open Project → navigate to **Project Settings** → **API**.
2. Click **Generate new JWT secret** (Warning: This immediately invalidates all active user sessions and existing JWT tokens).
3. Verify that new `anon` and `service_role` tokens are generated automatically upon JWT secret replacement.
4. Open your production **Supabase Edge Functions** environment variables configuration and update `SUPABASE_SERVICE_ROLE_KEY`.
5. Redeploy all Edge Functions (`supabase functions deploy create_worker`).
6. Distribute the newly updated `SUPABASE_ANON_KEY` to developers for their local `.env` configuration files and update your automated build CI/CD deployment repository secrets.
7. Re-trigger an application build and submit a mandatory app update to the Google Play Store.

### B. Android App Signing & Upload Key
1. If an upload key is compromised, generate a new Java Keystore file via terminal:
   ```bash
   keytool -genkey -v -keystore new_upload_key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias waanofi_key
   ```
2. Export the PEM certificate:
   ```bash
   keytool -export -rfc -keystore new_upload_key.jks -alias waanofi_key -file new_upload_cert.pem
   ```
3. Contact **Google Play Console Developer Support** to request an Upload Key Reset and provide the `new_upload_cert.pem` file.

### C. Post-Rotation Validation
- [ ] Attempt logging into mobile app with an old token (must be gracefully rejected and redirected to login).
- [ ] Confirm new logins generate valid JWT sessions signed by the new secret.
- [ ] Verify that background offline database sync completes successfully using the updated anonymous key.
- [ ] Verify Supabase Edge Functions execute cleanly without 401 Unauthorized errors.
