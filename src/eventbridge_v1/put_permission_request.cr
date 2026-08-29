module Amazonite::EventBridgeV1
  class PutPermissionRequest
    include JSON::Serializable

    # The name of the event bus associated with the rule. If you omit this, the default event bus is
    # used.
    @[JSON::Field(key: "EventBusName")]
    property event_bus_name : String | Nil

    # The action that you are enabling the other account to perform.
    @[JSON::Field(key: "Action")]
    property action : String | Nil

    # The 12-digit Amazon Web Services account ID that you are permitting to put events to your
    # default event bus. Specify "*" to permit any account to put events to your default event bus.
    #
    # If you specify "*" without specifying `Condition`, avoid creating rules that may match
    # undesirable events. To create more secure rules, make sure that the event pattern for each rule
    # contains an `account` field with a specific account ID from which to receive events. Rules with
    # an account field do not match any events sent from other accounts.
    @[JSON::Field(key: "Principal")]
    property principal : String | Nil

    # An identifier string for the external account that you are granting permissions to. If you later
    # want to revoke the permission for this external account, specify this `StatementId` when you run
    # [RemovePermission](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_RemovePermission.html).
    #
    # Each `StatementId` must be unique.
    @[JSON::Field(key: "StatementId")]
    property statement_id : String | Nil

    # This parameter enables you to limit the permission to accounts that fulfill a certain condition,
    # such as being a member of a certain Amazon Web Services organization. For more information about
    # Amazon Web Services Organizations, see [What Is Amazon Web Services
    # Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html)
    # in the *Amazon Web Services Organizations User Guide*.
    #
    # If you specify `Condition` with an Amazon Web Services organization ID, and specify "*" as the
    # value for `Principal`, you grant permission to all the accounts in the named organization.
    #
    # The `Condition` is a JSON string which must contain `Type`, `Key`, and `Value` fields.
    @[JSON::Field(key: "Condition")]
    property condition : Condition | Nil

    # A JSON string that describes the permission policy statement. You can include a `Policy`
    # parameter in the request instead of using the `StatementId`, `Action`, `Principal`, or
    # `Condition` parameters.
    @[JSON::Field(key: "Policy")]
    property policy : String | Nil

    def initialize(
      @event_bus_name : String | Nil = nil,
      @action : String | Nil = nil,
      @principal : String | Nil = nil,
      @statement_id : String | Nil = nil,
      @condition : Condition | Nil = nil,
      @policy : String | Nil = nil,
    )
    end
  end
end
