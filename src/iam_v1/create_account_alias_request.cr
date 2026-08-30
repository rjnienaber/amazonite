private alias Core = Amazonite::Core

module Amazonite::IamV1
  class CreateAccountAliasRequest
    # The account alias to create.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of lowercase letters, digits, and dashes. You cannot start or finish with
    # a dash, nor can you have two dashes in a row.
    property account_alias : String

    def initialize(
      @account_alias : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}AccountAlias", @account_alias}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        account_alias: Core::XMLValue.string(node.xpath_node("*[local-name()='AccountAlias']")).not_nil!,
      )
    end

    def_equals_and_hash(@account_alias)
  end
end
