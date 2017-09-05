require 'test_helper'

class GalleryAttachmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gallery_attachment = gallery_attachments(:one)
  end

  test "should get index" do
    get gallery_attachments_url
    assert_response :success
  end

  test "should get new" do
    get new_gallery_attachment_url
    assert_response :success
  end

  test "should create gallery_attachment" do
    assert_difference('GalleryAttachment.count') do
      post gallery_attachments_url, params: { gallery_attachment: { gallery_id: @gallery_attachment.gallery_id, photo: @gallery_attachment.photo } }
    end

    assert_redirected_to gallery_attachment_url(GalleryAttachment.last)
  end

  test "should show gallery_attachment" do
    get gallery_attachment_url(@gallery_attachment)
    assert_response :success
  end

  test "should get edit" do
    get edit_gallery_attachment_url(@gallery_attachment)
    assert_response :success
  end

  test "should update gallery_attachment" do
    patch gallery_attachment_url(@gallery_attachment), params: { gallery_attachment: { gallery_id: @gallery_attachment.gallery_id, photo: @gallery_attachment.photo } }
    assert_redirected_to gallery_attachment_url(@gallery_attachment)
  end

  test "should destroy gallery_attachment" do
    assert_difference('GalleryAttachment.count', -1) do
      delete gallery_attachment_url(@gallery_attachment)
    end

    assert_redirected_to gallery_attachments_url
  end
end
