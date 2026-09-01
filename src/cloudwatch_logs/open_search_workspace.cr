private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  # This structure contains information about the OpenSearch Service workspace used for this
  # integration. An OpenSearch Service workspace is the collection of dashboards along with other
  # OpenSearch Service tools. This workspace was created automatically as part of the integration
  # setup. For more information, see [Centralized OpenSearch user interface (Dashboards) with
  # OpenSearch
  # Service](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/application.html).
  class OpenSearchWorkspace
    include JSON::Serializable

    # The ID of this workspace.
    @[JSON::Field(key: "workspaceId")]
    property workspace_id : String | Nil

    # This structure contains information about the status of an OpenSearch Service resource.
    @[JSON::Field(key: "status")]
    property status : OpenSearchResourceStatus | Nil

    def initialize(
      @workspace_id : String | Nil = nil,
      @status : OpenSearchResourceStatus | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @workspace_id
        raise Core::ValidationError.new("workspaceId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("workspaceId length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("workspaceId does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_/#A-Za-z0-9]+$"))
      end

      if value = @status
        value.validate!
      end
    end

    def_equals_and_hash(@workspace_id, @status)
  end
end
