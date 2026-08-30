private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  # This structure contains complete information about one CloudWatch Logs integration. This
  # structure is returned by a
  # [GetIntegration](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetIntegration.html)
  # operation.
  class OpenSearchIntegrationDetails
    include JSON::Serializable

    # This structure contains information about the OpenSearch Service data source used for this
    # integration. This data source was created as part of the integration setup. An OpenSearch
    # Service data source defines the source and destination for OpenSearch Service queries. It
    # includes the role required to execute queries and write to collections.
    #
    # For more information about OpenSearch Service data sources , see [Creating OpenSearch Service
    # data source integrations with Amazon
    # S3.](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/direct-query-s3-creating.html)
    @[JSON::Field(key: "dataSource")]
    property data_source : OpenSearchDataSource | Nil

    # This structure contains information about the OpenSearch Service application used for this
    # integration. An OpenSearch Service application is the web application that was created by the
    # integration with CloudWatch Logs. It hosts the vended logs dashboards.
    @[JSON::Field(key: "application")]
    property application : OpenSearchApplication | Nil

    # This structure contains information about the OpenSearch Service collection used for this
    # integration. This collection was created as part of the integration setup. An OpenSearch Service
    # collection is a logical grouping of one or more indexes that represent an analytics workload.
    # For more information, see [Creating and managing OpenSearch Service Serverless
    # collections](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-collections.html).
    @[JSON::Field(key: "collection")]
    property collection : OpenSearchCollection | Nil

    # This structure contains information about the OpenSearch Service workspace used for this
    # integration. An OpenSearch Service workspace is the collection of dashboards along with other
    # OpenSearch Service tools. This workspace was created automatically as part of the integration
    # setup. For more information, see [Centralized OpenSearch user interface (Dashboards) with
    # OpenSearch
    # Service](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/application.html).
    @[JSON::Field(key: "workspace")]
    property workspace : OpenSearchWorkspace | Nil

    # This structure contains information about the OpenSearch Service encryption policy used for this
    # integration. The encryption policy was created automatically when you created the integration.
    # For more information, see [Encryption
    # policies](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-encryption.html#serverless-encryption-policies)
    # in the OpenSearch Service Developer Guide.
    @[JSON::Field(key: "encryptionPolicy")]
    property encryption_policy : OpenSearchEncryptionPolicy | Nil

    # This structure contains information about the OpenSearch Service network policy used for this
    # integration. The network policy assigns network access settings to collections. For more
    # information, see [Network
    # policies](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-network.html#serverless-network-policies)
    # in the OpenSearch Service Developer Guide.
    @[JSON::Field(key: "networkPolicy")]
    property network_policy : OpenSearchNetworkPolicy | Nil

    # This structure contains information about the OpenSearch Service data access policy used for
    # this integration. The access policy defines the access controls for the collection. This data
    # access policy was automatically created as part of the integration setup. For more information
    # about OpenSearch Service data access policies, see [Data access control for Amazon OpenSearch
    # Serverless](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-data-access.html)
    # in the OpenSearch Service Developer Guide.
    @[JSON::Field(key: "accessPolicy")]
    property access_policy : OpenSearchDataAccessPolicy | Nil

    # This structure contains information about the OpenSearch Service data lifecycle policy used for
    # this integration. The lifecycle policy determines the lifespan of the data in the collection. It
    # was automatically created as part of the integration setup.
    #
    # For more information, see [Using data lifecycle policies with OpenSearch Service
    # Serverless](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html)
    # in the OpenSearch Service Developer Guide.
    @[JSON::Field(key: "lifecyclePolicy")]
    property lifecycle_policy : OpenSearchLifecyclePolicy | Nil

    def initialize(
      @data_source : OpenSearchDataSource | Nil = nil,
      @application : OpenSearchApplication | Nil = nil,
      @collection : OpenSearchCollection | Nil = nil,
      @workspace : OpenSearchWorkspace | Nil = nil,
      @encryption_policy : OpenSearchEncryptionPolicy | Nil = nil,
      @network_policy : OpenSearchNetworkPolicy | Nil = nil,
      @access_policy : OpenSearchDataAccessPolicy | Nil = nil,
      @lifecycle_policy : OpenSearchLifecyclePolicy | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @data_source
        value.validate!
      end

      if value = @application
        value.validate!
      end

      if value = @collection
        value.validate!
      end

      if value = @workspace
        value.validate!
      end

      if value = @encryption_policy
        value.validate!
      end

      if value = @network_policy
        value.validate!
      end

      if value = @access_policy
        value.validate!
      end

      if value = @lifecycle_policy
        value.validate!
      end
    end

    def_equals_and_hash(@data_source, @application, @collection, @workspace, @encryption_policy, @network_policy, @access_policy, @lifecycle_policy)
  end
end
