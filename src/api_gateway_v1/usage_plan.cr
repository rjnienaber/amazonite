private alias Core = Amazonite::Core

module Amazonite::ApiGatewayV1
  # Represents a usage plan used to specify who can assess associated API stages. Optionally, target
  # request rate and quota limits can be set. In some cases clients can exceed the targets that you
  # set. Don’t rely on usage plans to control costs. Consider using [Amazon Web Services
  # Budgets](https://docs.aws.amazon.com/cost-management/latest/userguide/budgets-managing-costs.html)
  # to monitor costs and
  # [WAF](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html) to manage API
  # requests.
  class UsagePlan
    include JSON::Serializable

    # The identifier of a UsagePlan resource.
    @[JSON::Field(key: "id")]
    property id : String | Nil

    # The name of a usage plan.
    @[JSON::Field(key: "name")]
    property name : String | Nil

    # The description of a usage plan.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    # The associated API stages of a usage plan.
    @[JSON::Field(key: "apiStages")]
    property api_stages : Array(ApiStage) | Nil

    # A map containing method level throttling information for API stage in a usage plan.
    @[JSON::Field(key: "throttle")]
    property throttle : ThrottleSettings | Nil

    # The target maximum number of permitted requests per a given unit time interval.
    @[JSON::Field(key: "quota")]
    property quota : QuotaSettings | Nil

    # The Amazon Web Services Marketplace product identifier to associate with the usage plan as a
    # SaaS product on the Amazon Web Services Marketplace.
    @[JSON::Field(key: "productCode")]
    property product_code : String | Nil

    # The collection of tags. Each tag element is associated with a given resource.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @id : String | Nil = nil,
      @name : String | Nil = nil,
      @description : String | Nil = nil,
      @api_stages : Array(ApiStage) | Nil = nil,
      @throttle : ThrottleSettings | Nil = nil,
      @quota : QuotaSettings | Nil = nil,
      @product_code : String | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @api_stages
        value.each(&.validate!)
      end

      if value = @throttle
        value.validate!
      end

      if value = @quota
        value.validate!
      end
    end

    def_equals_and_hash(@id, @name, @description, @api_stages, @throttle, @quota, @product_code, @tags)
  end
end
