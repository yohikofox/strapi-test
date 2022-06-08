module.exports = ({ env }) => ({
  connection: {
    client: 'postgres',
    connection: {
      host: env('DATABASE_HOST', '127.0.0.1'),
      port: env.int('DATABASE_PORT', 5432),
      database: env('DATABASE_NAME', 'cms'),
      user: env('DATABASE_USERNAME', 'hr4impact'),
      password: env('DATABASE_PASSWORD', 'hr4impact'),
      ssl: env.bool('DATABASE_SSL', false),
    },
  },
});
