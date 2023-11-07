import requests
response = requests.post(
  "https://huggingface.co/api/repos/create",
  json={"private":"True","name":"github","organization":"shellplc","type":"model"},
  headers={"Authorization":"Bearer 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"}
)
print(response)
