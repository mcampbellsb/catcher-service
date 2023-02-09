require 'sinatra'

before do
  @now = Time.now
  logger.info("Got a #{request.request_method} request at #{@now.strftime("%Y-%m-%d:%H-%M-%S.%L")}")
  @request_payload = if request.body&.size > 0
                       request.body.rewind
                       JSON.parse(request.body.read, symbolize_names: true)
                     else
                       {}
                     end
  @request_params = request.params || {}

  logger.info("Body was #{@request_payload}")
  logger.info("Params were #{@request_params}")
end

get '/health' do
  'ok'
end

# catchalls - keep these last
get '/*' do
end

post '/*' do
end
