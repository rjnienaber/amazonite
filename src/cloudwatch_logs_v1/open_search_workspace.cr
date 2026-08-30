module Amazonite::CloudWatchLogsV1
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
  end
end
