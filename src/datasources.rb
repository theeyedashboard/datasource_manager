class DataSource

  # kickstart with prebuilt datasources
  @datasources = [
    {
      :id          => 1,
      :title       => 'First datasource',
      :description => 'Description for datasource #1'
    },
    {
      :id          => 2,
      :title       => 'Second datasource',
      :description => 'Description for datasource #2'
    }
  ]

  # return all datasources
  def self.all
    @datasources
  end
end
