terraform {
    required_providers {
        scalr = {
            source = "registry.scalr.io/scalr/scalr"
            version= "3.13.1"
        }
    }
}

resource "scalr_provider_configuration" "kubernetes" {
  name       = "k8s33"

  custom {
    provider_name = "kubernetes"
    argument {
      name        = "host"
      value       = "https://kubernetes.io/flyscan1/hyperspectral/hydrocarbon-detection-quantification/cpp/0.11.0-rc4@sha256:096e5910715111c60af9d804a455471b626c20ded014bb226c7947decd81d07c"
      #value       = "https://kubernetes.io/flyscan1/hyperspectral/hydrocarbon-detection-quantification/cpp/argus:0.11.0-rc4@sha256:096e5910715111c60af9d804a455471b626c20ded014bb226c7947decd81d07c"
      description = "The hostname (in form of URI) of the Kubernetes API."
    }
    argument {
        name = "text"
        value = "(sensitive)[kIjXqo+id+K2Fg8GU0lmv3FiwhGopcKe31RaaN9tlPU=]"
        #value  = "(sensitive)[tdyAsy7xbbX1pIkeLbCYiJdeg3mwxJM36r+Pa5qM6rY=]"
    }
  }
}


resource "scalr_provider_configuration" "kubernetes2" {
  name       = "k8s2222"

  custom {
    provider_name = "kubernetes2"
    argument {
        name = "longText"
        value = <<EOT
import { isEmpty } from 'lodash-es';

import { ResourceAttributeNode } from '@scalr/react/pages/Workspaces/Runs/dashboard/Pipeline/steps/Plan/VisualPlan/types';
import { isPlainObject } from '@scalr/react/pages/Workspaces/Runs/dashboard/Pipeline/steps/Plan2/VisualPlan/utils/isPlainObject';

import { Colorizer } from './Colorizer';
import { DiffLine } from './DiffLine';

import { MoreExpandButton } from './MoreExpandButton';
import { ObjectNodeDetails } from './ObjectNodeDetails';
import { Offset } from './Offset';

export const ObjectNode = (props: ObjectNodeType) => {
    const { node, deep } = props;
    const { action, attributeName, value, type } = node;

    const expanderRenderer = (expanded: boolean) => (
        <>
            {!isEmpty(value) && expanded && (
                <>
                    <ObjectNodeDetails node={node} deep={deep} />

                    <DiffLine action={action}>
                    </DiffLine>
                </>
            )}
        </>
    );

    const chunks = useMemo(() => {
        const previousText = formatValue(previousValue);
        const currentText = formatValue(value);

        const diff = diffWordsWithSpace(previousText, currentText, {
            timeout: 1000
        });

        if (!diff) {
            return [
            ];
        }

        return diff.filter(
            (chunk) => (!chunk.removed && action === 'add') || (!chunk.added && action === 'delete'),
        );
    }, [previousValue, value, action]);

    return (
        <GeneralNode
            valueRenderer={valueRenderer}
            expanderRenderer={expanderRenderer}
            expandable={!isEmpty(value)}
        />
    );
};
EOF
        }
    }
}
