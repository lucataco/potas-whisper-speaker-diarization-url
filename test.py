import banana_dev as client
from io import BytesIO
from PIL import Image
import base64

# Localhost test
    # docker build -t auto .
    # docker run --gpus=all -p 8000:8000 auto
my_model = client.Client(
    api_key="",
    model_key="",
    url="http://localhost:8000",
)

# Cloud test


inputs = {
    "youtube_url": "https://www.youtube.com/watch?v=7minSgqi-Gw",
}

# Call your model's inference endpoint on Banana.
# If you have set up your Potassium app with a
# non-default endpoint, change the first
# method argument ("/")to specify a
# different route.
result, meta = my_model.call("/", inputs)
print(result)
