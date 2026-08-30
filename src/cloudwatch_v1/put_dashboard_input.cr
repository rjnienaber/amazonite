private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class PutDashboardInput
    include JSON::Serializable

    # The name of the dashboard. If a dashboard with this name already exists, this call modifies that
    # dashboard, replacing its current contents. Otherwise, a new dashboard is created. The maximum
    # length is 255, and valid characters are A-Z, a-z, 0-9, "-", and "_". This parameter is required.
    @[JSON::Field(key: "DashboardName")]
    property dashboard_name : String

    # The detailed information about the dashboard in JSON format, including the widgets to include
    # and their location on the dashboard. This parameter is required.
    #
    # For more information about the syntax, see [Dashboard Body Structure and
    # Syntax](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Dashboard-Body-Structure.html).
    @[JSON::Field(key: "DashboardBody")]
    property dashboard_body : String

    # A list of key-value pairs to associate with the dashboard. You can associate as many as 50 tags
    # with a dashboard.
    #
    # Tags can help you organize and categorize your dashboards. You can also use them to scope user
    # permissions by granting a user permission to access or change only dashboards with certain tag
    # values.
    #
    # You can use this parameter only when creating a new dashboard. If you specify `Tags` when
    # updating an existing dashboard, the tag updates are ignored. To add or update tags on an
    # existing dashboard, use
    # [TagResource](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_TagResource.html).
    # To remove tags, use
    # [UntagResource](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_UntagResource.html).
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    def initialize(
      @dashboard_name : String,
      @dashboard_body : String,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dashboard_name, @dashboard_body, @tags)
  end
end
