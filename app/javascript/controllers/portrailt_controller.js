import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="images"
export default class extends Controller {
  /* ①静的プロパティを定義（data-{controller}-target で指定したターゲット名） */
  static targets = ["select"]


  deleteImage(){
    const csrfToken = document.getElementsByName('csrf-token')[0].content 
    const options = {
      method: 'POST',
      headers: {
        'X-CSRF-Token': csrfToken
      },
      // body: formData
    }

    fetch("/accounts/delete_image", options) 
    // .then((response) => response.json())
    .then((result) => {
      console.log('Success:', result);
      location.reload();
    })
    // .then((response) => response.json())
    .then((result) => {
      console.log('Success:', result);
    })
    .catch((error) => {
      console.error(error)
    })
  }

  /* ②画像選択時の処理 */

  
  selectImage(){
    const files = this.selectTargets[0].files // file_fieldで取得した画像ファイル
    for(const file of files){
      this.uploadImage(file) // 選択した画像ファイルのアップロード
    }
    this.selectTarget.value = "" // 選択ファイルのリセット
  }

  /* ③画像アップロード */
  uploadImage(file){
    const csrfToken = document.getElementsByName('csrf-token')[0].content // CSRFトークンを取得
    const formData = new FormData()
    formData.append("image", file) // formDataオブジェクトに画像ファイルをセット
    const options = {
      method: 'POST',
      headers: {
        'X-CSRF-Token': csrfToken
      },
      body: formData
    }
  /* fetchで画像ファイルをPostコントローラー(upload_imageアクション)に送信 */
    fetch("/accounts/upload_image", options) 
      // .then((response) => response.json())
      .then((result) => {
        console.log('Success:', result);
        location.reload();
      })
      // .then((response) => response.json())
      .then((result) => {
        console.log('Success:', result);
      })
      .catch((error) => {
        console.error(error)
      })
  }


}