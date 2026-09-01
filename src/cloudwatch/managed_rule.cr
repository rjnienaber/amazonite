private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  # Contains the information that's required to enable a managed Contributor Insights rule for an
  # Amazon Web Services resource.
  class ManagedRule
    include JSON::Serializable

    # The template name for the managed Contributor Insights rule, as returned by
    # `ListManagedInsightRules`.
    @[JSON::Field(key: "TemplateName")]
    property template_name : String

    # The ARN of an Amazon Web Services resource that has managed Contributor Insights rules.
    @[JSON::Field(key: "ResourceARN")]
    property resource_arn : String

    # A list of key-value pairs that you can associate with a managed Contributor Insights rule. You
    # can associate as many as 50 tags with a rule. Tags can help you organize and categorize your
    # resources. You also can use them to scope user permissions by granting a user permission to
    # access or change only the resources that have certain tag values. To associate tags with a rule,
    # you must have the `cloudwatch:TagResource` permission in addition to the
    # `cloudwatch:PutInsightRule` permission. If you are using this operation to update an existing
    # Contributor Insights rule, any tags that you specify in this parameter are ignored. To change
    # the tags of an existing rule, use `TagResource`.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    def initialize(
      @template_name : String,
      @resource_arn : String,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @template_name
        raise Core::ValidationError.new("TemplateName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TemplateName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("TemplateName does not match the required pattern") unless value.matches?(Regex.new("^[0-9A-Za-z][\\-\\.\\_0-9A-Za-z]{0,126}[0-9A-Za-z]$"))
      end

      if value = @resource_arn
        raise Core::ValidationError.new("ResourceARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceARN length must be <= 1024") if value.size > 1024
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@template_name, @resource_arn, @tags)
  end
end
