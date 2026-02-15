# GitHub Pages Setup

## Step-by-step guide to enabling GitHub Pages

### 1. Open repository settings

Visit: https://github.com/XDcobra/maven/settings/pages

### 2. Configure Build and Deployment

**Source:**
- Select: `Deploy from a branch`

**Branch:**
- Branch: `main` (or `master`, depending on which branch exists)
- Folder: `/ (root)`

**Click "Save"**

### 3. Wait for the deployment

- GitHub will automatically trigger the GitHub Actions workflow
- This usually takes 1–2 minutes
- You can monitor progress at https://github.com/XDcobra/maven/actions

### 4. Verify the URL

After a successful deployment, your Maven repository will be available at:
```
https://xdcobra.github.io/maven/
```

### 5. Test the configuration

Open the URL in a browser. You should see the index page with information about the Maven repository.

## GitHub Actions workflow

The file `.github/workflows/pages.yml` is already configured and will automatically:
- Run on every push to `main` or `master`
- Deploy the repository contents to GitHub Pages
- Update the Pages URL

## Troubleshooting

### GitHub Pages shows "404 - File not found"

**Fix:**
1. Check that GitHub Pages is enabled in the repository settings
2. Ensure the correct branch is selected
3. Wait 2–5 minutes after the initial activation
4. Clear your browser cache and try again

### GitHub Actions workflow fails

**Fix:**
1. Go to https://github.com/XDcobra/maven/actions
2. Click the failed workflow run
3. Inspect the error logs
4. Make sure the permissions are set correctly:
   - Settings → Actions → General
   - Workflow permissions: "Read and write permissions"

### Site not updating

**Fix:**
1. Check the GitHub Actions tab
2. Wait for the workflow to finish
3. It can take up to 10 minutes for changes to appear
4. Clear your browser cache

## Permissions

The GitHub Actions require the following permissions (already configured in the workflow file):
- `contents: read` - read repository contents
- `pages: write` - write to GitHub Pages
- `id-token: write` - OIDC token for deployment

These are granted automatically by GitHub when Pages is enabled.

## Custom domain (optional)

If you want to use a custom domain:

1. Go to Settings → Pages
2. Enter your domain under "Custom domain"
3. Follow the DNS configuration instructions
4. Enable "Enforce HTTPS" after successful verification

## More information

- [GitHub Pages documentation](https://docs.github.com/en/pages)
- [GitHub Actions documentation](https://docs.github.com/en/actions)
- [Jekyll themes](https://pages.github.com/themes/)
