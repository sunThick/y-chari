namespace :unattached_images do
  desc "紐付けされなかったアップロード(active_storage_blobs)を削除する"
  # タスク名(purge)を指定
  task purge: :environment do
    ActiveStorage::Blob.unattached.find_each(&:purge) # ←処理内容
  end
end