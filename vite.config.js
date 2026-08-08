import { defineConfig } from 'vite';

// https://vitejs.dev/config/
export default defineConfig({
  // Relative base path ensures assets load properly regardless of repo subpath or custom domain
  base: './',
});
