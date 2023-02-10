require 'sinatra'

before do
  @request_payload = if request.body&.size > 0
                       request.body.rewind
                       JSON.parse(request.body.read, symbolize_names: true)
                     else
                       {}
                     end
  @request_params = request.params || {}

  # logger.info("Body: #{@request_payload}")
  # logger.info("Params: #{@request_params}")
  logger.info("<=== got request")
end

get '/health' do
  'ok'
end

# catchalls - keep these last
get '/*' do
end

post '/*' do
end
