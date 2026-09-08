private alias Core = Amazonite::Core

module Amazonite::EC2
  class EnableInstanceSqlHaStandbyDetectionsRequest
    # The IDs of the instances to enable for SQL Server High Availability standby detection
    # monitoring.
    property instance_ids : Array(String) = [] of String

    # The ARN of the Secrets Manager secret containing the SQL Server access credentials. The
    # specified secret must contain valid SQL Server credentials for the specified instances. If not
    # specified, deafult local user credentials will be used by the Amazon Web Services Systems
    # Manager agent. To enable instances with different credentials, you must make separate requests.
    property sql_server_credentials : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @instance_ids : Array(String),
      @sql_server_credentials : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @instance_ids.each_with_index(1) do |item, i|
        params << {"#{prefix}InstanceId.#{i}", item}
      end

      if value = @sql_server_credentials
        params << {"#{prefix}SqlServerCredentials", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_ids: node.xpath_nodes("*[local-name()='InstanceId']/*[local-name()='item']").map { |n| n.content },
        sql_server_credentials: Core::XMLValue.string(node.xpath_node("*[local-name()='SqlServerCredentials']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @instance_ids
        raise Core::ValidationError.new("InstanceIds must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("InstanceIds must have at most 30 item(s)") if value.size > 30
      end

      if value = @sql_server_credentials
        raise Core::ValidationError.new("SqlServerCredentials does not match the required pattern") unless value.matches?(Regex.new("^(?=.{20,2048}$)arn:aws[a-z-]*:secretsmanager:[a-z0-9-]+:\\d{12}:secret:[a-zA-Z0-9/_+=.@-]+$"))
      end
    end

    def_equals_and_hash(@instance_ids, @sql_server_credentials, @dry_run)
  end
end
