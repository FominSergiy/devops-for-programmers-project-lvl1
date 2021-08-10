module.exports = ({ env }) => ({
  host: env('HOST', '0.0.0.0'),
  port: env.int('PORT', 8080),
  url: 'http://localhost',
  admin: {
    auth: {
      secret: env('ADMIN_JWT_SECRET', '1e50b4bc8bde8d540f7ad38a59f69673'),
    },
  },
});
