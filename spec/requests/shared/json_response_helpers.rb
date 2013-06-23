module JsonResponseHelpers
  shared_context 'json response' do
    let (:json)       { JSON.parse response.body }
    let (:json_meta)  { json['meta']}
    let (:json_data)  { json['data']}
    let (:json_error) { json_meta['error'] }
  end
end
