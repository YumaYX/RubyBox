require 'json'

class YSJson2Hash

  attr_reader :json_hash, :jsonfile

  def initialize(jsonfile)
    @jsonfile = jsonfile
    json_2_hash
  end

  def json_2_hash
    @json_hash = {}
    File.open(@jsonfile) do |j|
      @json_hash = JSON.load(j)
    end
    @json_hash
  end

end

