private alias Core = Amazonite::Core

module Amazonite::EC2
  class RestoreManagedPrefixListVersionRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the prefix list.
    property prefix_list_id : String

    # The version to restore.
    property previous_version : Int64

    # The current version number for the prefix list.
    property current_version : Int64

    def initialize(
      @prefix_list_id : String,
      @previous_version : Int64,
      @current_version : Int64,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}PrefixListId", @prefix_list_id}

      params << {"#{prefix}PreviousVersion", @previous_version.to_s}

      params << {"#{prefix}CurrentVersion", @current_version.to_s}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        prefix_list_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PrefixListId']")).not_nil!,
        previous_version: Core::XMLValue.i64(node.xpath_node("*[local-name()='PreviousVersion']")).not_nil!,
        current_version: Core::XMLValue.i64(node.xpath_node("*[local-name()='CurrentVersion']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @prefix_list_id, @previous_version, @current_version)
  end
end
