Image Denoising Using Shearlet Transform
This repository contains MATLAB code for image denoising using the shearlet transform. The workflow involves transforming an input image into the shearlet domain, performing denoising, and reconstructing the output image using the inverse shearlet transform.

Workflow Overview
Input Image: Provide the input image to be denoised.
Shearlet Transform: The input image is transformed into the shearlet domain for multiscale and directional representation.
Denoising: Noise is removed by thresholding or filtering in the shearlet domain.
Inverse Shearlet Transform: The denoised coefficients are used to reconstruct the output image in the spatial domain.
Output Image: The final denoised image.
Files in the Repository
shearlet_transform.m: Performs the shearlet transform on the input image.
denoising.m: Applies denoising techniques in the shearlet domain.
inverse_shearlet_transform.m: Reconstructs the image using the inverse shearlet transform.
main.m: Main script to execute the denoising pipeline.
sample_image.jpg: A sample input image for testing.
README.md: Documentation for the project (this file).
Requirements
MATLAB R2020a or later
ShearLab toolbox (or any required library for shearlet transforms)
Usage
Clone the repository:

bash
Copy code
git clone https://github.com/your-username/image-denoising-shearlet.git
cd image-denoising-shearlet
Run the main script:

matlab
Copy code
main
Replace sample_image.jpg with your input image for testing.

Example
The following figure illustrates the workflow of the denoising process:


Citation
If you use this code in your work, please cite it appropriately.
