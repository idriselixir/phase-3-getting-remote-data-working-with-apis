require 'net/http'
require 'open-uri'
require 'json'

class GetPrograms
  URL = "http://data.cityofnewyork.us/resource/uvks-tn5n.json"

  def get_programs
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def program_school
    programs = JSON.parse(self.get_programs)
    programs.collect { |program| program["agency"] }
  end
end

programs = GetPrograms.new
puts programs.program_school.uniq
