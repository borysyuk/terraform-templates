terraform {
    required_providers {
        scalr = {
            source = "registry.scalr.io/scalr/scalr"
            version= "3.13.1"
        }
    }
}
resource "scalr_provider_configuration" "kubernetes" {
  name       = "k8s"
  custom {
    provider_name = "kubernetes"
    argument {
      name        = "host"
      #value       = "https://kubernetes.io/flyscan1/hyperspectral/hydrocarbon-detection-quantification/cpp/0.11.0-rc4@sha256:096e5910715111c60af9d804a455471b626c20ded014bb226c7947decd81d07c"
      value       = "https://kubernetes.io/flyscan1/hyperspectral/hydrocarbon-detection-quantification/cpp/argus:0.11.0-rc4@sha256:096e5910715111c60af9d804a455471b626c20ded014bb226c7947decd81d07c"
      description = "The hostname (in form of URI) of the Kubernetes API."
      demoArray = null
      demoObject = null
      #demoArray = []
      #demoObject = {}
      secret = "(sensitive)[kIjXqo+id+K2Fg8GU0lmv3FiwhGopcKe31RaaN9tlPU=]"
      #secret = "(sensitive)[tdyAsy7xbbX1pIkeLbCYiJdeg3mwxJM36r+Pa5qM6rY=]"
      longText = <<EOT
import { isEmpty } from 'lodash-es';

import { ResourceAttributeNode } from '@scalr/react/pages/Workspaces/Runs/dashboard/Pipeline/steps/Plan/VisualPlan/types';
import { isPlainObject } from '@scalr/react/pages/Workspaces/Runs/dashboard/Pipeline/steps/Plan/VisualPlan/utils/isPlainObject';

import { Colorizer } from './Colorizer';
import { DiffLine } from './DiffLine';
import { GeneralNode } from './GeneralNode';
import { MoreExpandButton } from './MoreExpandButton';
import { ObjectNodeDetails } from './ObjectNodeDetails';
import { Offset } from './Offset';

type ObjectNodeType = {
    node: ResourceAttributeNode;
    deep: number;
};

export const ObjectNode = (props: ObjectNodeType) => {
    const { node, deep } = props;
    const { action, attributeName, value, type } = node;

    const valueRenderer = (expanded: boolean) => {
        if (isPlainObject(value)) {
            if (isEmpty(value)) return '{}';

            return <MoreExpandButton type="object" action={action} expanded={expanded} />;
        }

        return String(value);
    };

    const expanderRenderer = (expanded: boolean) => (
        <>
            {!isEmpty(value) && expanded && (
                <>
                    <ObjectNodeDetails node={node} deep={deep} />

                    <DiffLine action={action}>
                        <Offset deep={deep}>
                            <Colorizer type={type}>{'}'}</Colorizer>
                        </Offset>
                    </DiffLine>
                </>
            )}
        </>
    );

    return (
        <GeneralNode
            valueRenderer={valueRenderer}
            expanderRenderer={expanderRenderer}
            type={type}
            action={action}
            deep={deep}
            initExpanded={!isEmpty(value) && deep < 10 && action !== 'no-op'}
            attributeName={attributeName}
            expandable={!isEmpty(value)}
        />
    );
};
EOT
    }
  }
}
