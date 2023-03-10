database_name = "news_ties_#{LuckyEnv.environment}"

AppDatabase.configure do |settings|
  if db_url = ENV["DATABASE_URL"]?
    settings.credentials = Avram::Credentials.parse(db_url)
    next
  end

  next if LuckyEnv.production?

  settings.credentials = Avram::Credentials.new(
    database: database_name,
    hostname: ENV["DB_HOST"]? || "localhost",
    port: ENV["DB_PORT"]?.try(&.to_i) || 5432,
    # Some common usernames are "postgres", "root", or your system username (run 'whoami')
    username: ENV["DB_USERNAME"]? || (LuckyEnv.development? ? "lucky_dev" : "postgres"),
    # Some Postgres installations require no password. Use "" if that is the case.
    password: ENV["DB_PASSWORD"]? || (LuckyEnv.development? ? "lucky_dev_pass" : "postgres")
  )
end

Avram.configure do |settings|
  settings.database_to_migrate = AppDatabase

  # In production, allow lazy loading (N+1).
  # In development and test, raise an error if you forget to preload associations
  settings.lazy_load_enabled = LuckyEnv.production?

  # Always parse `Time` values with these specific formats.
  # Used for both database values, and datetime input fields.
  # settings.time_formats << "%F"
end
