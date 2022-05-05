class Grader

  require 'rest-client'

  @@glot_api_token = '7dc296c5-b178-40d8-a0b2-00f06afd05a6'

  def initialize(testcases, language, code)
    @testcases = testcases
    @language = language
    @extension = Language.where(name: @language).pick(:extension)
    @code = code
  end

  def grade

    header_token = "Token " + @@glot_api_token

    @headers = {"Authorization" => header_token, "Content-type" => "application/json"}

    @url = "https://glot.io/api/run/#{@language}/latest"

    results = {}

    @testcases.each do |key,value|

      @array = Array.new

      payload = {}
      payload[:stdin] = key
      payload[:files] = @array << {:name => "main#{@extension}", :content => @code}

      payload = payload.to_json

      puts(payload)

      response = RestClient.post(@url, payload, headers=@headers)

      puts(response.body)

      decoded_response = JSON.parse(response.body)

      if decoded_response['stdout'] == value
        results[key] = 'Pass'
      elsif decoded_response['stderr'] != ''
        results[key] = decoded_response['stderr']
      else
        results[key] = decoded_response['stdout']
      end

    end

    puts(results)

  end

end
