json.meta do
  json.extract! @meta, *@meta.keys if @meta
  json.action_time @action_time
end

json.data JSON.parse(yield)

error_list = []
error_list << @error if @error

json.errors error_list 