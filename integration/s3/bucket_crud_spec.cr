require "../spec_helper"

private alias AS = Amazonite::S3

describe "S3: basic bucket and object operations" do
  bucket = "amazonite-integration-test-bucket"
  key = "nested/path/hello.txt"
  body = "hello from amazonite"
  client = AS::Client.new

  it "removes an existing bucket" do
    listing = client.list_objects_v2(AS::ListObjectsV2Request.new(bucket: bucket))
    keys = listing.result.contents.try(&.compact_map(&.key)) || [] of String
    keys.each { |k| client.delete_object(AS::DeleteObjectRequest.new(bucket: bucket, key: k)) }
    client.delete_bucket(AS::DeleteBucketRequest.new(bucket: bucket))
  rescue AS::NoSuchBucket
  end

  it "creates a bucket" do
    # Outside us-east-1 the region has to be restated in the request body,
    # which is what puts an XML document on a request for the first time here.
    region = AS::BucketLocationConstraint.from_json_object_key?(ENV["AWS_REGION"]? || "us-west-2")
    configuration = AS::CreateBucketConfiguration.new(location_constraint: region)
    response = client.create_bucket(AS::CreateBucketRequest.new(bucket: bucket, create_bucket_configuration: configuration))
    response.http.status_code.should eq(200)

    wait_until do
      client.head_bucket(AS::HeadBucketRequest.new(bucket: bucket)).http.status_code == 200
    rescue AS::NotFound
      false
    end
  end

  it "lists the bucket" do
    response = client.list_buckets(AS::ListBucketsRequest.new)
    response.http.status_code.should eq(200)

    names = response.result.buckets.try(&.compact_map(&.name)) || [] of String
    names.should contain(bucket)
  end

  it "puts and gets an object" do
    put = client.put_object(AS::PutObjectRequest.new(bucket: bucket, key: key, body: body))
    put.http.status_code.should eq(200)
    put.result.e_tag.should_not be_nil

    get = client.get_object(AS::GetObjectRequest.new(bucket: bucket, key: key))
    get.http.status_code.should eq(200)
    get.result.body.should eq(body)
    get.result.content_length.should eq(body.bytesize)
    get.result.last_modified.should_not be_nil
  end

  it "lists the object" do
    response = client.list_objects_v2(AS::ListObjectsV2Request.new(bucket: bucket, prefix: "nested/"))
    response.http.status_code.should eq(200)
    response.result.key_count.should eq(1)

    contents = response.result.contents || raise "expected the listing to have contents"
    contents.map(&.key).should eq([key])
    contents.first.size.should eq(body.bytesize)
  end

  it "tags the object" do
    tagging = AS::Tagging.new(tag_set: [AS::Tag.new(key: "Environment", value: "test")])
    put = client.put_object_tagging(AS::PutObjectTaggingRequest.new(bucket: bucket, key: key, tagging: tagging))
    put.http.status_code.should eq(200)

    get = client.get_object_tagging(AS::GetObjectTaggingRequest.new(bucket: bucket, key: key))
    get.http.status_code.should eq(200)
    get.result.tag_set.map { |tag| {tag.key, tag.value} }.should eq([{"Environment", "test"}])
  end

  it "deletes the object and the bucket" do
    delete = client.delete_objects(AS::DeleteObjectsRequest.new(
      bucket: bucket,
      delete: AS::Delete.new(objects: [AS::ObjectIdentifier.new(key: key)]),
    ))
    delete.http.status_code.should eq(200)
    delete.result.deleted.try(&.map(&.key)).should eq([key])

    client.delete_bucket(AS::DeleteBucketRequest.new(bucket: bucket)).http.status_code.should eq(204)

    expect_raises(AS::NoSuchBucket) do
      client.list_objects_v2(AS::ListObjectsV2Request.new(bucket: bucket))
    end
  end
end
