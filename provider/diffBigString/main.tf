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
import { Fragment, useMemo } from 'react';
import { diffWordsWithSpace } from 'diff';

import { AttributeValueType } from '@scalr/react/pages/Workspaces/Runs/dashboard/Pipeline/steps/Plan/VisualPlan/types';
import { formatValue } from '@scalr/react/pages/Workspaces/Runs/dashboard/Pipeline/steps/Plan/VisualPlan/utils/formatValue';
import { classNames } from '@scalr/react/utils/classNames';

type HighlightPropsType = {
    action: 'add' | 'delete';
    value?: AttributeValueType;
    previousValue?: AttributeValueType;
};

export const HighlightDiff = ({ action, value, previousValue }: HighlightPropsType) => {
    console.log('previousValue', previousValue?.toString().length);
    console.log('previousValue', value?.toString().length);
    const chunks = useMemo(() => {
        const previousText = formatValue(previousValue);
        const currentText = formatValue(value);

        const diff = diffWordsWithSpace(previousText, currentText, {
            //timeout: 1000,
            maxEditLength: 1000,
        });

        if (!diff) {
            return [
                {
                    value: action === 'add' ? currentText : previousText,
                    added: false,
                    removed: false,
                    count: 1,
                },
            ];
        }

        return diff.filter(
            (chunk) => (!chunk.removed && action === 'add') || (!chunk.added && action === 'delete'),
        );
    }, [previousValue, value, action]);

    return (
        <>
            {chunks.map((chunk, index) => {
                if (chunk.added || chunk.removed) {
                    return (
                        <span
                            key={`${chunk.value}-${index}`}
                            className={classNames('visual-plan-highlight-chunk', [
                                'visual-plan-highlight-chunk-add',
                                'visual-plan-highlight-chunk-delete',
                                action === 'add',
                            ])}
                        >
                            {chunk.value}
                        </span>
                    );
                }

                return <Fragment key={`${chunk.value}-${index}`}>{chunk.value}</Fragment>;
            })}
        </>
    );
};

        EOT
    }
  }
}
