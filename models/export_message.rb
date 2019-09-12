class ExportMessage

  def initialize(body, from)
    @body = body
    @from = from
  end


  def send
    conn = Faraday.new(url: 'http://0d597df1.ngrok.io')
    response = conn.get do |req|
      req.url '/webhook'
      req.params['zip'] = ["#{@body}"]
    end
    return response.body
  end


  def get_json(send)
    JSON.parse(send, symbolize_names: true)
  end
end
