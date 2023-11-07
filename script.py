import requests
response = requests.post(
  "https://huggingface.co/api/repos/create",
  json={"private":"True","name":"github","organization":"shellplc","type":"model"},
  headers={"Authorization":"Bearer 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"}
)
if(response.status_code==409):
  !git push https://Umang-Sehgal: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@huggingface.co/shellplc/github main
