private alias AF = Amazonite::Forecast
private alias Core = Amazonite::Core

module Amazonite::Forecast
  class Client < Core::Client
    Log = ::Log.for("amazonite.forecast.client")

    def initialize(config = Core::Config.new)
      super("AmazonForecast", "forecast", "1.1", nil, config)
    end

    # Creates an Amazon Forecast predictor.
    #
    # Amazon Forecast creates predictors with AutoPredictor, which involves applying the optimal
    # combination of algorithms to each time series in your datasets. You can use CreateAutoPredictor
    # to create new predictors or upgrade/retrain existing predictors.
    #
    # **Creating new predictors**
    #
    # The following parameters are required when creating a new predictor:
    #
    # - `PredictorName` - A unique name for the predictor.
    #
    # - `DatasetGroupArn` - The ARN of the dataset group used to train the predictor.
    #
    # - `ForecastFrequency` - The granularity of your forecasts (hourly, daily, weekly, etc).
    #
    # - `ForecastHorizon` - The number of time-steps that the model predicts. The forecast horizon is
    # also called the prediction length.
    #
    # When creating a new predictor, do not specify a value for `ReferencePredictorArn`.
    #
    # **Upgrading and retraining predictors**
    #
    # The following parameters are required when retraining or upgrading a predictor:
    #
    # - `PredictorName` - A unique name for the predictor.
    #
    # - `ReferencePredictorArn` - The ARN of the predictor to retrain or upgrade.
    #
    # When upgrading or retraining a predictor, only specify values for the `ReferencePredictorArn`
    # and `PredictorName`.
    def create_auto_predictor(input : AF::CreateAutoPredictorRequest) : Core::ParsedResponse(AF::CreateAutoPredictorResponse)
      Log.info { "performing 'CreateAutoPredictor' operation" }
      input.validate! if config.validate_input?
      response = post("CreateAutoPredictor", "/", input.to_json)
      Core::ParsedResponse(AF::CreateAutoPredictorResponse).new(response)
    end
  end
end
