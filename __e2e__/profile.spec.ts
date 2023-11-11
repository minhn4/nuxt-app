import { test, expect } from "@playwright/test";

test("has title", async ({ page }) => {
  await page.goto("/");

  const profile = page.getByRole("button", { name: "Profile 100" });
  await expect(profile).toBeVisible();
});
