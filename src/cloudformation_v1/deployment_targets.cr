private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # Specifies the Organizations accounts where you want to create, update, or delete stack
  # instances. You can target either your entire organization or specific accounts using
  # organizational units (OUs) and account filter options.
  #
  # CloudFormation doesn't deploy stack instances to the organization management account, even if
  # the organization management account is in your organization or in an OU in your organization.
  #
  # When performing create operations, if you specify both `OrganizationalUnitIds` and `Accounts`,
  # you must also specify the `AccountFilterType` property.
  class DeploymentTargets
    # The Amazon Web Services account IDs where you want to perform stack operations. How these
    # accounts are used depends on the `AccountFilterType` property.
    #
    # If you have many account numbers, you can provide those accounts using the `AccountsUrl`
    # property instead.
    property accounts : Array(String) | Nil

    # The Amazon S3 URL path to a file that contains a list of Amazon Web Services account IDs. The
    # file format must be either `.csv` or `.txt`, and the data can be comma-separated or
    # new-line-separated. There is currently a 10MB limit for the data (approximately 800,000
    # accounts).
    #
    # This property serves the same purpose as `Accounts` but allows you to specify a large number of
    # accounts.
    property accounts_url : String | Nil

    # The organization root ID or organizational unit (OU) IDs where you want to perform stack
    # operations. CloudFormation will perform operations on accounts within these OUs and their child
    # OUs.
    property organizational_unit_ids : Array(String) | Nil

    # Refines which accounts will have stack operations performed on them by specifying how to use the
    # `Accounts` and `OrganizationalUnitIds` properties together.
    #
    # The following values determine how CloudFormation selects target accounts:
    #
    # - `INTERSECTION`: Performs stack operations only on specific individual accounts within the
    # selected OUs. Only accounts that are both specified in the `Accounts` property and belong to the
    # specified OUs will be targeted.
    #
    # - `DIFFERENCE`: Performs stack operations on all accounts in the selected OUs except for
    # specific accounts listed in the `Accounts` property. This enables you to exclude certain
    # accounts within an OU, such as suspended accounts.
    #
    # - `UNION`: Performs stack operations on the specified OUs plus additional individual accounts
    # listed in the `Accounts` property. This is the default value if `AccountFilterType` is not
    # provided. This lets you target an entire OU and individual accounts from a different OU in one
    # request. Note that `UNION` is not supported for `CreateStackInstances` operations.
    #
    # - `NONE`: Performs stack operations on all accounts in the specified organizational units (OUs).
    property account_filter_type : AccountFilterType | Nil

    def initialize(
      @accounts : Array(String) | Nil = nil,
      @accounts_url : String | Nil = nil,
      @organizational_unit_ids : Array(String) | Nil = nil,
      @account_filter_type : AccountFilterType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@accounts || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Accounts.member.#{i}", item}
      end

      if value = @accounts_url
        params << {"#{prefix}AccountsUrl", value}
      end

      (@organizational_unit_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}OrganizationalUnitIds.member.#{i}", item}
      end

      if value = @account_filter_type
        params << {"#{prefix}AccountFilterType", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        accounts: node.xpath_nodes("*[local-name()='Accounts']/*[local-name()='member']").map { |n| n.content },
        accounts_url: Core::XMLValue.string(node.xpath_node("*[local-name()='AccountsUrl']")),
        organizational_unit_ids: node.xpath_nodes("*[local-name()='OrganizationalUnitIds']/*[local-name()='member']").map { |n| n.content },
        account_filter_type: (n = node.xpath_node("*[local-name()='AccountFilterType']")) ? ACF::AccountFilterType.from_json_object_key?(n.content) : nil,
      )
    end

    def_equals_and_hash(@accounts, @accounts_url, @organizational_unit_ids, @account_filter_type)
  end
end
