$("#productFile").click(e=>{
    $("#productFileInput").click();
});

$("#productFileInput").change(e => {
    const file = e.target.files[0];
    const reader = new FileReader();
    reader.onload = e => {
        $("#productFile").attr("src", e.target.result);
        $("#upfilename").text(file.name);
    }
    reader.readAsDataURL(file);
});

$("#resetInsert").click(e=>{
    if (confirm("상품 등록을 취소하시겠습니까?")) {
      history.back();
    }
});





