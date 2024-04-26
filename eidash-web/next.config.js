const API_BASE = process.env.API_BASE || "http://localhost:3000";

/** @type {import('next').NextConfig} */
const nextConfig = {
  output: "standalone",
  rewrites: async () => [
    {
      source: "/api/:path*",
      destination: `${API_BASE}/api/:path*`,
    },
  ],
};

module.exports = nextConfig;
