import { test, expect } from '@playwright/test';

test('Hello World', async ({ page }) => {
  // Abre uma página em branco
  await page.goto('about:blank');

  // Insere "Hello World" no body da página via JavaScript
  await page.setContent('<h1>Helllo World</h1>');

  // Verifica se o texto está visível
  await expect(page.getByText('Hello World')).toBeVisible();
});
