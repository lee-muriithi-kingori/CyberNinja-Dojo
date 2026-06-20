## Summary

Fixes #13.

- Removes implicit localhost fallback from the frontend API client.
- Requires explicit `VITE_API_BASE_URL` outside development.
- Keeps development behavior intentional with `/api/v1`.
- Normalizes configured API base URLs by trimming trailing slashes.
- Adds API base URL behavior coverage.

## Validation

- Ran `python3 build.py --module frontend`
- Ran `cd frontend && npm run build`

Diagnostic artifacts:
- diagnostic/build-fab0cc58.json

Note: Termux/Android could not generate the encrypted `.logd` artifact because the project diagnostic tool reports no supported `encryptly` binary for this platform. I included the generated JSON diagnostic artifact and direct frontend build validation.
