task :import => :environment do
  Rake::Task["db:drop"].invoke
  Rake::Task["db:create"].invoke
  Rake::Task["db:migrate"].invoke
  file = File.read('rushing.json')
  data_hash = JSON.parse(file)

  data_hash.each do |p|
    record = Player.new
    record.player = p['Player']
    record.team = p['Team']
    record.position = p['Pos']
    record.avg_attempts_per_game = p['Att']
    record.total_attempts = p['Att/G']
    record.total_yards = p['Yds']
    record.average_yards_per_attempt = p['Avg']
    record.yards_per_game = p['Yds/G']
    record.total_touchdowns = p['TD']
    record.longest_rush = p['Lng']
    record.first_downs = p['1st']
    record.first_down_percentage = p['1st%']
    record.twenty_yards_plus_each = p['20+']
    record.forty_yards_plus_each = p['40+']
    record.fumbles = p['FUM']
    record.save
    # record
  end
  # data.select(&:persisted?)
end
