module Calendar
  def self.retrieve
    @calendar ||= begin
      config = YAML.load(
        ERB.new(
          File.read(
            Rails.root.join('config', "google_api.yml"
        ))).result)[(Rails.env || 'development')]

      Google::Calendar.new(
        :username => config['username'],
        :password => config['password'],
        :app_name => config['app_name'])
    end
  end
end