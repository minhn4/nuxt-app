import { test, expect } from "@playwright/test";

test("has profile", async ({ page }) => {
  await page.goto("/");

  const profileButton = page.getByLabel('Expand "Account Settings"');
  profileButton.click();
  const profile = page.getByText(
    "SettingsUse Mobile DataBluetoothJohn DoeLogout",
  );
  await expect(profile).toBeVisible();
});
