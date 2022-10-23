require "../spec_helper"

private alias DB = Amazonite::DynamoDBv2
private alias AC = Amazonite::Core

describe "DynamoDB: basic crud operations" do
  table_name = "Music"
  key = {
    "Artist"    => DB::AttributeValue.new("Soundgarden"),
    "SongTitle" => DB::AttributeValue.new("Burden In The Hand"),
  }
  client = DB::Client.new

  it "lists tables and removes existing" do
    list_response = client.list_tables(DB::ListTablesInput.new)
    list_response.http.status_code.should eq(200)

    list_response.result.table_names.try &.each do |name|
      next unless name.starts_with?(table_name)

      delete_response = client.delete_table(DB::DeleteTableInput.new(name))
      delete_response.http.status_code.should eq(200)

      wait_until do
        client.describe_table(DB::DescribeTableInput.new(table_name))
        false
      rescue e : AC::ResponseException
        true
      end
    end
  end

  it "creates a table" do
    model = DB::CreateTableInput.new(
      [
        DB::AttributeDefinition.new("Artist", DB::ScalarAttributeType::S),
        DB::AttributeDefinition.new("SongTitle", DB::ScalarAttributeType::S),
      ],
      table_name,
      [
        DB::KeySchemaElement.new("Artist", DB::KeyType::Hash),
        DB::KeySchemaElement.new("SongTitle", DB::KeyType::Range),
      ],
      provisioned_throughput: DB::ProvisionedThroughput.new(10, 5),
    )

    response = client.create_table(model)

    response.http.status_code.should eq(200)
    table_description = response.result.try &.table_description
    table_description.should_not be_nil
    table_description.try &.table_name.should eq(table_name)

    attribute_definition = table_description.try &.attribute_definitions.try &.[0]
    attribute_definition.should_not be_nil
    attribute_definition.try &.attribute_name.should eq("Artist")

    # wait for table to become active
    wait_until do
      response = client.describe_table(DB::DescribeTableInput.new(table_name))
      response.result.try &.table.try &.table_status == DB::TableStatus::Active
    end
  end

  it "creates items" do
    items = [
      DB::PutItemInput.new(
        table_name,
        {
          "Artist"    => DB::AttributeValue.new("Soundgarden"),
          "SongTitle" => DB::AttributeValue.new("Let Me Drown"),
        }
      ),
      DB::PutItemInput.new(table_name, key),
    ]

    items.each do |item|
      response = client.put_item(item)
      response.http.status_code.should eq(200)
    end
  end

  it "reads an item" do
    item = DB::GetItemInput.new(
      table_name,
      {
        "Artist"    => DB::AttributeValue.new("Soundgarden"),
        "SongTitle" => DB::AttributeValue.new("Let Me Drown"),
      }
    )

    response = client.get_item(item)

    response.http.status_code.should eq(200)

    item = response.result.try &.item
    item.should_not be_nil
    item.try &.["Artist"].try &.s.should eq("Soundgarden")
    item.try &.["SongTitle"].try &.s.should eq("Let Me Drown")
  end

  it "updates an item" do
    item = DB::UpdateItemInput.new(table_name, key,
      {
        "Rating" => DB::AttributeValueUpdate.new(
          DB::AttributeValue.new("Good"),
          DB::AttributeAction::Put
        ),
      }
    )

    response = client.update_item(item)
    response.http.status_code.should eq(200)

    response = client.get_item(DB::GetItemInput.new(table_name, key))
    response.http.status_code.should eq(200)

    item = response.result.try &.item
    item.should_not be_nil
    item.try &.["Rating"].try &.s.should eq("Good")
  end

  it "deletes the item" do
    response = client.delete_item(DB::DeleteItemInput.new(table_name, key))
    response.http.status_code.should eq(200)

    response = client.get_item(DB::GetItemInput.new(table_name, key))
    response.http.status_code.should eq(200)
    response.result.try &.item.should be_nil
  end

  it "throws a dynamodb error", tags: "aws" do
    item = DB::UpdateItemInput.new("notable", key, {"Rating" => DB::AttributeValueUpdate.new})
    e = expect_raises(AC::ValidationException, "One or more parameter values were invalid: Only DELETE action is allowed when no attribute value is specified") do
      client.update_item(item)
    end
    e.http.should_not be_nil
  end

  it "throws a localstack error", tags: "localstack" do
    item = DB::UpdateItemInput.new("notable", key, {"Rating" => DB::AttributeValueUpdate.new})
    e = expect_raises(DB::ResourceNotFoundException, "Cannot do operations on a non-existent table") do
      client.update_item(item)
    end
    e.http.should_not be_nil
  end
end
