# Image Noise Reduction Process

This repository provides an implementation of a noise reduction pipeline for images, as depicted in the flowchart. The method is designed to denoise noisy images while preserving important details such as edges and textures.

## Overview of the Process

The pipeline follows these steps:

1. **Input (Noisy Image)**: A noisy image is provided as the input.
2. **Speckle Reducing Anisotropic Diffusion (SRAD)**: 
   - This step reduces speckle noise while preserving image edges.
   - Commonly used in applications like medical imaging or SAR images.
3. **Logarithmic Transformation**:
   - Converts the image intensity range into a logarithmic scale.
   - Enhances contrast and prepares the data for further processing.
4. **Guide Filter**:
   - A guided filtering technique is used to smooth the image while maintaining sharp edges.
   - Operates based on a guidance image to retain structural details.
5. **Exponential Transformation**:
   - Restores the dynamic range of the image after the logarithmic transformation.
6. **Output (Noise-Free Image)**:
   - The final result is a noise-free image with enhanced details and reduced artifacts.

## Dependencies

The implementation requires the following libraries:
- **Python**: Recommended version >= 3.7
- **NumPy**: For numerical computations.
- **OpenCV**: For image processing functions.
- **Scipy**: For advanced mathematical operations (if applicable).

Install dependencies using:
```bash
pip install -r requirements.txt
 
