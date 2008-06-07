#!/bin/bash

for src in `find . -name "*.[c,h]"`
do
    echo "Auto-porting '$src' from GMime-2.2 to GMime-2.4..."
    sed -e "s/GMimeDisposition/GMimeContentDisposition/g" \
	-e "s/GMimePartEncodingType/GMimeContentEncoding/g" \
	-e "s/GMIME_PART_ENCODING_/GMIME_CONTENT_ENCODING_/g" \
	-e "s/GMIME_FILTER_CRLF_ENCODE/TRUE/g" \
	-e "s/GMIME_FILTER_CRLF_DECODE/FALSE/g" \
	-e "s/GMIME_FILTER_CRLF_MODE_CRLF_DOTS/TRUE/g" \
	-e "s/GMIME_FILTER_CRLF_MODE_CRLF_ONLY/FALSE/g" \
	-e "s/GMIME_FILTER_YENC_DIRECTION_ENCODE/TRUE/g" \
	-e "s/GMIME_FILTER_YENC_DIRECTION_DECODE/FALSE/g" \
	-e "s/g_mime_stream_filter_new_with_stream/g_mime_stream_filter_new/g" \
	-e "s/g_mime_object_add_header/g_mime_object_append_header/g" \
	-e "s/g_mime_header_register_writer/g_mime_header_list_register_writer/g" \
	-e "s/g_mime_header_write_to_stream/g_mime_header_list_write_to_stream/g" \
	-e "s/g_mime_header_to_string/g_mime_header_list_to_string/g" \
	-e "s/g_mime_header_destroy/g_mime_header_list_destroy/g" \
	-e "s/g_mime_header_prepend/g_mime_header_list_prepend/g" \
	-e "s/g_mime_header_remove/g_mime_header_list_remove/g" \
	-e "s/g_mime_header_add/g_mime_header_list_append/g" \
	-e "s/g_mime_header_get/g_mime_header_list_get/g" \
	-e "s/g_mime_header_set/g_mime_header_list_set/g" \
	-e "s/g_mime_header_new/g_mime_header_list_new/g" \
	-e "s/g_mime_message_get_headers/g_mime_object_get_headers/g" \
	-e "s/g_mime_message_add_header/g_mime_object_append_header/g" \
	-e "s/g_mime_message_get_header/g_mime_object_get_header/g" \
	-e "s/g_mime_message_set_header/g_mime_object_set_header/g" \
	-e "s/g_mime_message_write_to_stream/g_mime_object_write_to_stream/g" \
	-e "s/g_mime_message_to_string/g_mime_object_to_string/g" \
	-e "s/g_mime_message_get_date_string/g_mime_message_get_date_as_string/g" \
	-e "s/GMimeDisposition/GMimeContentDisposition/g" \
	-e "s/g_mime_disposition_new/g_mime_content_disposition_new_from_string/g" \
	-e "s/g_mime_disposition_destroy/g_mime_content_disposition_destroy/g" \
	-e "s/g_mime_disposition_add_parameter/g_mime_content_disposition_set_parameter/g" \
	-e "s/g_mime_disposition_get_parameter/g_mime_content_disposition_get_parameter/g" \
	-e "s/g_mime_disposition_get/g_mime_content_disposition_get_disposition/g" \
	-e "s/g_mime_disposition_set/g_mime_content_disposition_set_disposition/g" \
	-e "s/g_mime_part_get_content_disposition_parameter/g_mime_object_get_content_disposition_parameter/g" \
	-e "s/g_mime_part_add_content_disposition_parameter/g_mime_object_set_content_disposition_parameter/g" \
	-e "s/g_mime_part_get_content_disposition_object/g_mime_object_get_content_disposition/g" \
	-e "s/g_mime_part_set_content_disposition_object/g_mime_object_set_content_disposition/g" \
	-e "s/g_mime_part_get_content_disposition/g_mime_object_get_disposition/g" \
	-e "s/g_mime_part_set_content_disposition/g_mime_object_set_disposition/g" \
	-e "s/g_mime_part_get_content_type/g_mime_object_get_content_type/g" \
	-e "s/g_mime_part_set_content_type/g_mime_object_set_content_type/g" \
	-e "s/g_mime_part_write_to_stream/g_mime_object_write_to_stream/g" \
	-e "s/g_mime_part_to_string/g_mime_object_to_string/g" \
	-e "s/g_mime_utils_base64_encode_close/g_mime_encoding_base64_encode_close/g" \
	-e "s/g_mime_utils_base64_encode_step/g_mime_encoding_base64_encode_step/g" \
	-e "s/g_mime_utils_base64_decode_step/g_mime_encoding_base64_decode_step/g" \
	-e "s/g_mime_utils_quoted_encode_close/g_mime_encoding_quoted_encode_close/g" \
	-e "s/g_mime_utils_quoted_encode_step/g_mime_encoding_quoted_encode_step/g" \
	-e "s/g_mime_utils_quoted_decode_step/g_mime_encoding_quoted_decode_step/g" \
	-e "s/g_mime_utils_uuencode_close/g_mime_encoding_uuencode_close/g" \
	-e "s/g_mime_utils_uuencode_step/g_mime_encoding_uuencode_step/g" \
	-e "s/g_mime_utils_uudecode_step/g_mime_encoding_uudecode_step/g" \
	-e "s/g_mime_utils_8bit_header_encode_phrase/g_mime_utils_header_encode_phrase/g" \
	-e "s/g_mime_utils_8bit_header_encode/g_mime_utils_header_encode_text/g" \
	-e "s/g_mime_utils_8bit_header_decode/g_mime_utils_header_decode_text/g" \
	-e "s/g_mime_cipher_validity_free/g_mime_signature_validity_free/g" \
	-e "s/g_mime_cipher_validity_get_description/g_mime_signature_validity_get_details/g" \
	-e "s/g_mime_cipher_validity_set_description/g_mime_signature_validity_set_details/g" \
	-e "s/g_mime_cipher_hash_name/g_mime_cipher_context_hash_name/g" \
	-e "s/g_mime_cipher_hash_id/g_mime_cipher_context_hash_id/g" \
	-e "s/g_mime_cipher_sign/g_mime_cipher_context_sign/g" \
	-e "s/g_mime_cipher_verify/g_mime_cipher_context_verify/g" \
	-e "s/g_mime_cipher_encrypt/g_mime_cipher_context_encrypt/g" \
	-e "s/g_mime_cipher_decrypt/g_mime_cipher_context_decrypt/g" \
	-e "s/g_mime_cipher_import_keys/g_mime_cipher_context_import_keys/g" \
	-e "s/g_mime_cipher_export_keys/g_mime_cipher_context_export_keys/g" \
	-e "s/g_mime_object_unref/g_object_unref/g" \
	-e "s/g_mime_object_ref/g_object_ref/g" \
	-e "s/g_mime_stream_unref/g_object_unref/g" \
	-e "s/g_mime_stream_ref/g_object_ref/g" \
	< "$src" > "$src.tmp"
    mv "$src.tmp" "$src"
done