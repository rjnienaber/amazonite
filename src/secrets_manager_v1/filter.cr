private alias ASM = Amazonite::SecretsManagerV1

module Amazonite::SecretsManagerV1
  # Allows you to add filters when you use the search function in Secrets Manager. For more
  # information, see [Find secrets in Secrets
  # Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/manage_search-secret.html).
  class Filter
    include JSON::Serializable

    # The following are keys you can use:
    #
    # - **description**: Prefix match, not case-sensitive.
    #
    # - **name**: Prefix match, case-sensitive.
    #
    # - **tag-key**: Prefix match, case-sensitive.
    #
    # - **tag-value**: Prefix match, case-sensitive.
    #
    # - **primary-region**: Prefix match, case-sensitive.
    #
    # - **owning-service**: Prefix match, case-sensitive.
    #
    # - **all**: Breaks the filter value string into words and then searches all attributes for
    # matches. Not case-sensitive.
    @[JSON::Field(key: "Key", converter: ASM::FilterNameStringType)]
    property key : FilterNameStringType | Nil

    # The keyword to filter for.
    #
    # You can prefix your search value with an exclamation mark (`!`) in order to perform negation
    # filters.
    @[JSON::Field(key: "Values")]
    property values : Array(String) | Nil

    def initialize(
      @key : FilterNameStringType | Nil = nil,
      @values : Array(String) | Nil = nil,
    )
    end

    def_equals_and_hash(@key, @values)
  end
end
