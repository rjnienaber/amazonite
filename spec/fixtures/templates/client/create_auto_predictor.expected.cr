private alias AF = Amazonite::ForecastV2
private alias Core = Amazonite::Core

module Amazonite::ForecastV2
  class Client < Core::Client
    Log = ::Log.for("amazonite.forecast_v2.client")

    def initialize(config = Core::Config.new)
      super("AmazonForecast", "forecast", nil, config)
    end

    def create_auto_predictor(input : AF::CreateAutoPredictorRequest) : Core::ParsedResponse(AF::CreateAutoPredictorResponse)
      Log.info { "performing 'CreateAutoPredictor' operation" }
      response = post("CreateAutoPredictor", "/", input.to_json)
      Core::ParsedResponse(AF::CreateAutoPredictorResponse).new(response)
    end
  end
end
