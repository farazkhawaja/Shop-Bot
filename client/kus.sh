#!/bin/bash

# Create a directory for Kustomize (you can name it as you like)
mkdir -p kustomize-client
cd kustomize-client

# Create 'base' and 'overlays' directories
mkdir base
mkdir overlays

# Create 'kustomization.yaml' for the 'base' directory
cat <<EOL > base/kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
- deployment.yaml
- service.yaml
# Add other base resources as needed
EOL

# Create 'kustomization.yaml' for the 'overlays' directory
cat <<EOL > overlays/kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
- dev/
- staging/
# Add other overlays as needed
EOL

# Create subdirectories for 'dev' and 'staging' overlays
mkdir overlays/dev
mkdir overlays/staging

# Create 'kustomization.yaml' for the 'dev' overlay
cat <<EOL > overlays/dev/kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
- ingress.yaml
- configmap.yaml
# Add other resources specific to the 'dev' overlay
EOL

# Create 'kustomization.yaml' for the 'staging' overlay
cat <<EOL > overlays/staging/kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
- ingress.yaml
- secret.yaml
# Add other resources specific to the 'staging' overlay
EOL

# You can create actual resource files as needed in each directory
touch base/deployment.yaml
touch base/service.yaml
touch overlays/dev/ingress.yaml
touch overlays/dev/configmap.yaml
touch overlays/staging/ingress.yaml
touch overlays/staging/secret.yaml

# Optional: Display the created structure
echo "Kustomize directory structure created:"
tree
