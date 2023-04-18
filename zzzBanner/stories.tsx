import React, { ReactNode } from 'react';
import { Meta } from '@storybook/react/types-6-0';

import { Banner, BannerStatus, BannerType } from '@scalr/react/components/Banner/index';
import { Button } from '@scalr/react/components/Button';
import { ThemeIcons } from '@scalr/react/theme';

import styles from './stories.pcss';

export default {
    title: 'Components/Banner',
    component: Banner,

    parameters: { theme: 'scalr2' },
    argTypes: {
        type: {
            description: 'Type',
            table: {
                type: {
                    summary: 'BannerType',
                },
            },
        },
        status: {
            description: 'Status',
            table: {
                type: {
                    summary: 'BannerStatus',
                },
            },
        },
        showIcon: {
            description: 'show/hide banner icon',
            table: {
                type: {
                    summary: 'boolean',
                },
                defaultValue: {
                    summary: true,
                },
            },
        },
    },
} as Meta;

type SmallBannersPropsType = {
    children: ReactNode | [ReactNode, ReactNode];
    showIcon?: boolean;
};

const SmallBanners = (props: React.PropsWithChildren<SmallBannersPropsType>) => {
    const { showIcon, children } = props;

    return (
        <div className={styles.storyContainer}>
            <Banner status={BannerStatus.info} type={BannerType.small} showIcon={showIcon}>{children}</Banner>
            <Banner status={BannerStatus.success} type={BannerType.small} showIcon={showIcon}>{children}</Banner>
            <Banner status={BannerStatus.warning} type={BannerType.small} showIcon={showIcon}>{children}</Banner>
            <Banner status={BannerStatus.error} type={BannerType.small} showIcon={showIcon}>{children}</Banner>
        </div>
    );
};

export const SmallBanner = () => (
    <>
        <SmallBanners>Some small banner with icon</SmallBanners>
        <SmallBanners showIcon={false}>Some small banner without icon</SmallBanners>
    </>
);

// eslint-disable-next-line max-len
const smallBannerSource = '<Banner status={BannerStatus.info} type={BannerType.small} showIcon={showIcon}>{children}</Banner>';

SmallBanner.parameters = {
    docs: {
        source: {
            code: smallBannerSource,
        },
    },
};

export const SmallBannerWithAction = () => (
    <>
        <SmallBanners>
            Some small banner with icon
            <Button isText rightIcon={ThemeIcons.arrowRight}>Confirm</Button>
        </SmallBanners>
        <SmallBanners showIcon={false}>
            Some small banner without icon
            <Button isText rightIcon={ThemeIcons.arrowRight}>Confirm</Button>
        </SmallBanners>
    </>
);

// eslint-disable-next-line max-len
const smallBannerWithActionSource = '<Banner status={BannerStatus.info} type={BannerType.small} showIcon={showIcon}>{children}</Banner>';

SmallBannerWithAction.parameters = {
    docs: {
        source: {
            code: smallBannerWithActionSource,
        },
    },
};
