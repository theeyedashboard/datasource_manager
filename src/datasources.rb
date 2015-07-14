class DataSource

  # kickstart with prebuilt datasources
  @datasources = [
    {
      :id          => '1',
      :title       => 'First datasource',
      :description => 'Description for datasource #1'
    },
    {
      :id          => '2',
      :title       => 'Second datasource',
      :description => 'Description for datasource #2'
    }
  ]

  # return all datasources
  def self.all
    @datasources
  end

  def self.first
    return @datasources[0]
  end

  def self.find_by_id(id)
    for source in @datasources
      if source[:id] == id
        return source
      end
    end
    return nil
  end

end
