<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>사진 업로드 미리보기</title>
  <style>
   
    .image-preview {
      margin-top: 20px;
    }
    img {
      max-width: 300px;
      height: auto;
      display: block;
      border: 1px solid #ccc;
      padding: 5px;
      border-radius: 4px;
    }
  </style>
</head>
<body>
	<div class="edit_profile_img">
	
	  <h2>사진 업로드</h2>
	  <input type="file" id="imageInput" accept="image/*">
	  
	  <div class="image-preview" id="previewContainer">
	    <p>선택한 사진이 여기에 표시됩니다.</p>
	    <img id="preview" src="" alt="미리보기 이미지" style="display: none;">
	  </div>
	</div>

  <script>
    const imageInput = document.getElementById('imageInput');
    const preview = document.getElementById('preview');
    const previewContainer = document.getElementById('previewContainer');

    imageInput.addEventListener('change', function () {
      const file = imageInput.files[0];
      if (file) {
        const reader = new FileReader();
        reader.onload = function (e) {
          preview.src = e.target.result;
          preview.style.display = 'block';
        };
        reader.readAsDataURL(file);
      } else {
        preview.src = "";
        preview.style.display = 'none';
      }
    });
  </script>

</body>
</html>